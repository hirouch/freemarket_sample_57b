crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_show_url
  parent :root
end

crumb :profiles do
  link "プロフィール", profiles_show_url
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :information do
  link "本人情報の登録", mypages_information_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logouts_show_path
  parent :mypage
end

crumb :exhibition do
  link "出品した商品-出品中", exhibition_users_path
  parent :mypage
end

crumb :trading do
  link "出品した商品-取引中", trading_users_path
  parent :mypage
end

crumb :sold do
  link "出品した商品-売却済み", sold_users_path
  parent :mypage
end

crumb :item_syousai do
  link "変数", item_item_id
  parent :root
end

# crumb :Item do 
#   link items.name, issue
#   parent :root

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).