# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asumerag <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 08:59:55 by asumerag          #+#    #+#              #
#    Updated: 2021/02/10 09:16:03 by asumerag         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service nginx start
service mysql start
service php7.3-fpm start

echo "CREATE DATABASE wordpress;" |mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" |mysql -u root
echo "FLUSH PRIVILEGES;" |mysql -u root
echo "update mysql.user set plugin='' where user='root';"| mysql -u root

bash
