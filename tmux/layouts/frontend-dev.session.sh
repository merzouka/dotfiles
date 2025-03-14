# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$1"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "frontend"; then

  # Create a new window inline within session layout definition.
  new_window "code"
  new_window "server"
  new_window "browser"

  # Load a defined window layout.
  #load_window "example"

  select_window 2
  run_cmd "npm run dev"

  select_window 1
  run_cmd "cd src; nvim ."

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
