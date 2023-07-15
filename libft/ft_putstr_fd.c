/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dabdygal <dabdygal@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/12 15:25:39 by dabdygal          #+#    #+#             */
/*   Updated: 2023/07/15 19:06:24 by dabdygal         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

void	ft_putstr_fd(const char *s, int fd)
{
	if (!s)
		return ;
	while (*s)
	{
		write(fd, s, sizeof(char));
		s++;
	}
}
