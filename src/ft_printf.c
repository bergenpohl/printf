/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bpohl <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/06 21:18:10 by bpohl             #+#    #+#             */
/*   Updated: 2020/07/12 13:55:22 by bpohl            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_printf(const char *format, ...)
{
	t_profile	*profile;
	size_t		rv;

	profile = pf_init_profile(&format);
	va_start(profile->args, format);
	pf_parse_format(profile);
	va_end(profile->args);
	rv = profile->rv;
	free(profile->parsed);
	free(profile);
	if (rv >= 2147483647)
		return (-1);
	return ((int)rv);
}
