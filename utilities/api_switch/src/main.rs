use std::{collections::HashMap, env, fs::File, io::{BufRead, Write, BufReader, BufWriter}};

struct Key {
    value: String,
    selected: bool,
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let mut iter = args.iter();
    iter.next();
    let provider = iter.next().expect("Provider name expected.");
    let home = env::var("HOME").expect("Environment variable 'HOME' is not defined");
    let default_keys =  format!("{home}/.config/opencode/.api-keys");
    let keys_file = iter.next().unwrap_or(&default_keys);
    let mut keys: HashMap<String, Vec<Key>> = HashMap::new();
    let f = BufReader::new(
        File::open(keys_file)
            .unwrap_or_else(|e| panic!("Opening keys file failed: {e}"))
    );
    for (i, line) in f.lines().enumerate() {
        match line {
            Err(e) => eprintln!("Reading key at line:{i} failed: {e}"),
            Ok(k) => {
                if k.is_empty() {
                    eprintln!("Skipping empty line:{i}...");
                    continue;
                }
                let eq_index = match k.find("=") {
                    Some(i) => i,
                    None => {
                        eprintln!("Invalid key at line:{i}: provider not specified.");
                        continue;
                    },
                };
                let provider = k[..eq_index].to_lowercase();
                let mut key: Vec<char> = k[(eq_index+1)..].chars().collect();
                let mut selected = false;
                if let Some(last) = key.pop() {
                    if last == '*' {
                        selected = true;
                    } else {
                        key.push(last);
                    }
                } else {
                    eprintln!("Missing key at line:{i}. Skipping...");
                    continue;
                }
                let keys = keys.entry(provider).or_insert(vec![]);
                keys.push(Key{
                    value: key.iter().collect(),
                    selected
                });
            }
        }
    }

    let prov_keys = keys.get(provider).unwrap_or_else(|| panic!("Provider doesn't have any keys in file."));
    let mut selected = 0;
    for (i, k) in prov_keys.iter().enumerate() {
        if k.selected {
            selected = i;
            break;
        }
    }
    let keys_len = prov_keys.len();
    let prov_keys = keys.get_mut(provider).unwrap();
    prov_keys.get_mut((selected + 1) % keys_len).expect("Index out of range.").selected = true;
    prov_keys.get_mut(selected).expect("Index out of range.").selected = false;

    let file = File::options()
        .write(true)
        .open(keys_file)
        .unwrap_or_else(|e| panic!("Opening keys file failed for write: {e}"));
    let mut writer = BufWriter::new(file);
    for (prov, keys) in keys {
        for key in keys {
            match writeln!(writer, "{prov}={}{}", key.value, if key.selected { "*" } else { "" }) {
                Ok(_) => if prov == provider.as_str() && key.selected {
                    println!("Switched API keys for provider {provider} successfully");
                }
                ,
                Err(e) => eprintln!("Writing key ({prov}={}) failed: {e}", key.value)
            }
        }
    }
}
