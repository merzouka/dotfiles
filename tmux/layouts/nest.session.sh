# ~/.tmuxifier/layouts/my_project.session.sh

session_root "."

session_name="nest"
index=1
while tmux has-session -t "$session_name" 2>/dev/null; do
  session_name="${session_base}-${index}"
  ((index++))
done

if initialize_session "$session_name"; then
  new_window "editor" "cd src && nvim ."
  new_window "server" "pnpm start:dev -- -b swc"
  new_window "browser"
  select_window 1
fi

finalize_and_go_to_session
