crumb :root do
  link "トップ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
end

crumb :allshowitems do
  link "全商品一覧"
end

crumb :mypage_logout do
  link "ログアウト", user_path(current_user)
  parent :mypage
end

crumb :category_index do
  link "カテゴリー一覧", categories_path
end

# 親カテゴリーのパンくず
crumb :parent_category do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", category_path(category)
  parent :category_index
end
# -----------------------------------------------------------------
# 子カテゴリーのパンくず
crumb :child_category do |category|
  category = Category.find(params[:id])
  # 表示しているページが子カテゴリーの一覧ページの場合
  if category.has_children?
    link "#{category.name}", category_path(category)
    parent :parent_category

  # 表示しているページが孫カテゴリーの一覧ページの場合
  else
    link "#{category.parent.name}", category_path(category.parent)
    parent :parent_category
  end
end
# -----------------------------------------------------------------
# 孫カテゴリーのパンくず
crumb :grandchild_category do |category|
  category = Category.find(params[:id])
  link "#{category.name}", category_path(category)
  parent :child_category
end


crumb :item_category do |category|
  category = Item.find(params[:id]).category
  link "カテゴリー一覧", categories_path
  link "#{category.parent.parent.name}", category_path(category.parent.parent)
  link "#{category.parent.name}", category_path(category.parent)
  link "#{category.name}", category_path(category)
  link "#{Item.find(params[:id]).name}"

end

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