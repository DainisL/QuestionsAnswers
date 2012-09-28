root = ""
working_directory root
pid "/home/ubuntu/www/QuestionsAnswers/production/current/tmp/pids/unicorn.pid"
stderr_path "/home/ubuntu/www/QuestionsAnswers/production/current/unicorn/err.log"
stdout_path "/home/ubuntu/www/QuestionsAnswers/production/current/unicorn/out.log"

listen "/tmp/unicorn.todo.sock"
preload_app true
worker_processes 3
timeout 30
