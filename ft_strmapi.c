/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strmapi.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gialexan <gialexan@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/08 20:02:20 by gialexan          #+#    #+#             */
/*   Updated: 2022/11/06 18:58:41 by gialexan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strmapi(char const *s, char (*f)(unsigned int, char))
{
	size_t	i;
	size_t	len;
	char	*str;

	i = -1;
	if (!s || !f)
		return (0);
	len = ft_strlen(s);
	str = (char *) malloc ((len + 1) * sizeof(char));
	if (!str)
		return (NULL);
	while (++i < len)
		str[i] = f(i, s[i]);
	str[i] = '\0';
	return (str);
}
