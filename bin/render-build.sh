# #!/usr/bin/env bash
# # exit on error
# set -o errexit

# bundle install
# bundle exec rails assets:precompile
# bundle exec rails assets:clean


#!/usr/bin/env bash
# Exit on error
set -o errexit

chmod +x ./bin/rails

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate