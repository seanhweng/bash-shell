#!/usr/bin/env bash
# Created Date: 10-22-2022                                                    #
# Author: Sean Weng                                                           #
# -----                                                                       #
# Last Modified: 10-22-2022 04:03:58 pm                                       # 
# Modified By: Sean Weng at <onhay@yahoo.com>                                 # 
# -----                                                                       #
# Copyright (c) 2022 TBD.Co.Ltd,.                                             #
# -----                                                                       #
# HISTORY:                                                                    #
#

PROMPT_STR="Please choose your favorite vegetable: "

echo $PROMPT_STR

select VEGETABLE in "Beans" "Carrot" "Brocoli" "Lettues"; do
    echo
    echo "Your favorit vegetable is $VEGETABLE."
    echo
    break
done
exit
