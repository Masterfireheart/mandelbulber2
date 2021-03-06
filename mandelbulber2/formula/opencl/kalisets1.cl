/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Based on Kalisets1 and KaliDucks, from Mandelbulb 3D, and refer Formula proposed by Kali, with
 * features added by Darkbeam.
 *
 * <b>M3D notes:</b>
 * Try out julia and low R_bailout values of 2 down to 1!
 * You might have to cutoff at z=0 or so, to see something.
 * @reference
 * http://www.fractalforums.com/new-theories-and-research/very-simple-formula-for-fractal-patterns

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "Kalisets1Iteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 Kalisets1Iteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL4 c = aux->const_c;

	z = fabs(z);
	REAL sqs = (z.x * z.x + mad(z.y, z.y, z.z * z.z) + 1e-21f); // sph inv
	REAL m;
	REAL minR = fractal->transformCommon.minR0; //  KaliDucks

	if (sqs < minR)
		m = native_rsqrt(minR);
	else
		m = native_divide(fractal->transformCommon.scale, sqs); // kalisets

	z = z * m;
	aux->DE = mad(aux->DE, fabs(m), 1.0f);

	if (fractal->transformCommon.addCpixelEnabledFalse)
		z += c * fractal->transformCommon.constantMultiplier111;

	if (fractal->transformCommon.juliaMode) z += fractal->transformCommon.juliaC;

	if (fractal->transformCommon.rotationEnabled)
		z = Matrix33MulFloat4(fractal->transformCommon.rotationMatrix, z);
	return z;
}