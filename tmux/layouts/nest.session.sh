# ~/.tmuxifier/layouts/nest.session.sh

session_root "."

session_name="nest"
index=1
while tmux has-session -t "$session_name" 2>/dev/null; do
  session_name="nest-${index}"
  ((index++))
done

if initialize_session "$session_name"; then
  new_window "editor" "cd src && nvim ."
  new_window "server" "pnpm start:dev -- -b swc"
  new_window "browser"
  new_window "db" "$session_root/db-run.sh && pnpm drizzle-kit studio"
  select_window 1
fi

finalize_and_go_to_session
