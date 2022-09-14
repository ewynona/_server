# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoindex_off.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asumerag <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 19:52:35 by asumerag          #+#    #+#              #
#    Updated: 2021/02/11 21:57:11 by asumerag         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sed -i 's/autoindex on/autoindex off/g' ~/../etc/nginx/sites-available/default
service nginx restart
