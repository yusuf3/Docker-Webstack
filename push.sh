#git update-index --chmod=+x --add *.sh
git add .
wait
read -p "Commit description: " desc
wait
git commit -m "$desc"
wait
git push origin master
