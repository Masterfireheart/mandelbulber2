/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * scale - simple scale

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "TransfScaleIteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfScaleIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	z *= fractal->transformCommon.scale;
	REAL DEoffset = 1.0f;
	if (fractal->transformCommon.functionEnabledFalse) DEoffset = fractal->analyticDE.offset0;
	aux->DE = mad(aux->DE, fabs(fractal->transformCommon.scale), DEoffset);
	aux->r_dz *= fabs(fractal->transformCommon.scale);
	return z;
}