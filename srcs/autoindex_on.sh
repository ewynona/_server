# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoindex_on.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asumerag <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 19:51:38 by asumerag          #+#    #+#              #
#    Updated: 2021/02/11 21:57:29 by asumerag         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sed -i 's/autoindex off/autoindex on/g' ~/../etc/nginx/sites-available/default
service nginx restart
