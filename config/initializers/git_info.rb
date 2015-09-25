################################################################################
#   Git versions: to be used for debugging in views
#
#   source:
#     http://stackoverflow.com/questions/4329816/rails-3-app-how-to-get-git-version-and-update-website
#
#   07.12.2014  ZT
#   08.12.2014  Last update (GIT_COMMIT_TIMESTAMP)
#   15.05.2015  Update for non-development environment
################################################################################
if Rails.env.development?
  GIT_BRANCH           = `git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`
  GIT_COMMIT           = `git log --pretty=format:'%h' -n 1`
  GIT_COMMIT_TIMESTAMP = Time.at `git log --pretty=format:'%ct' -n 1`.to_i
end