#? BACKUP VERSION HISTORY

#! PUSH ---> 
#° MyApp
cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/htdocs/myapp
git push --set-upstream https://github.com/wdomi/MyApp.git master

#° config
cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/etc
git push --set-upstream https://github.com/wdomi/XAMPP_configFiles.git master 

#° beispiele
cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/htdocs/beispiele
git push --set-upstream https://github.com/wdomi/Besipiel.git master

#° d3demo
cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/htdocs/d3demo
git push --set-upstream https://github.com/wdomi/d3demo.git master


# #! PULL <--- 
# #° MyApp
# cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/htdocs/myapp
# git pull https://github.com/wdomi/MyApp.git

# #° config
# cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/etc
# git pull https://github.com/wdomi/XAMPP_configFiles.git

# #° beispiele
# cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/htdocs/beispiele
# git pull https://github.com/wdomi/Besipiel.git

# #° d3demo
# cd /Users/domiadmin/.bitnami/stackman/machines/xampp/volumes/root/htdocs/d3demo
# git pull https://github.com/wdomi/d3demo.git







