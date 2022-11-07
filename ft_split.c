/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gialexan <gialexan@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/09 14:28:20 by gialexan          #+#    #+#             */
/*   Updated: 2022/11/06 17:01:07 by gialexan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_count_str(char const *s, char c)
{
	size_t	i;
	size_t	count;

	i = 0;
	count = 0;
	while (s[i])
	{
		while (s[i] == c)
			i++;
		if (s[i] != c && s[i])
			count++;
		while (s[i] != c && s[i])
			i++;
	}
	return (count);
}

char	**ft_split(char const *s, char c)
{
	int		i;
	int		end;
	int		str_len;
	char	**str;

	i = 0;
	end = 0;
	str_len = ft_count_str(s, c);
	str = ft_calloc(sizeof(char *), (str_len + 1));
	if (!s || !str)
		return (0);
	while (i < str_len)
	{
		while (*s && *s == c)
			s++;
		while (s[end] != '\0' && s[end] != c)
			end++;
		str[i] = ft_substr(s, 0, end);
		s += end;
		end = 0;
		i++;
	}
	return (str);
}
