FROM nginx:latest

# ADD index1.html /usr/share/nginx/html/index.html
# index1 이 적용된 image 가 production

ADD index2.html /usr/share/nginx/html/index.html
# index2 가 적용된 image 가 canary
