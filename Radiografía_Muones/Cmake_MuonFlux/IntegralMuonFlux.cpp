//
// arXiv:1509.06176v1, A parametrization of the cosmic-ray muon flux at sea-level, Eq.(3).
// The integral intensity of muons above 1 GeV/c as a function of zenith angle is ploted.
//
double getFlux(double muonEnergy, double theta)
{
	const double P1 = 0.102573;
	const double P2 = -0.068287;
	const double P3 = 0.958633;
	const double P4 = 0.0407253;
	const double P5 = 0.817285;

	double cosTheta = cos(theta); 
	double cosThetaStar2 = ( cosTheta * cosTheta + P1 * P1 + P2 * pow(cosTheta, P3) + P4 * pow(cosTheta, P5) ) /
		(1. + P1*P1 + P2 + P4);
	double cosThetaStar = sqrt(cosThetaStar2);

	double Emu = muonEnergy;       // GeV

	double term1 = 1./(1 + 1.1 * Emu * cosThetaStar/115);
	double term2 = 0.054/(1 + 1.1 * Emu * cosThetaStar/850);

	double flux = 0.14 * pow(Emu * (1. + 3.64/(Emu * pow(cosThetaStar, 1.29))), -2.7) * (term1 +  term2);

	return flux * 10000; // 1/cm^2 -> 1/m^2
}

double funFlux(double *x, double *par)
{
	double muonEnergy = x[0];
	double theta = par[0]/180. * TMath::Pi();

	return getFlux(muonEnergy, theta);
}

void muonFlux3()
{
   TCanvas* c1 = new TCanvas("c1", "  ");
   c1->SetGrid();

   const int nAngle = 90;
   double angles[nAngle];
   double fluxes[nAngle];

   for(int i = 0; i < nAngle; ++i)
   {
       TF1 f1("f0", funFlux, 0.2, 6000, 1);
       f1.SetParameter(0, i);
       ROOT::Math::WrappedTF1 wf1(f1);
       ROOT::Math::GaussIntegrator ig;
       ig.SetFunction(wf1);
       ig.SetRelTolerance(0.001);

	   angles[i] = i;

	   // energy range for muon flux integration
       const double El = 1.;
       const double Eh = 5000.;
	   fluxes[i] = ig.Integral(El, Eh);
   }

   TGraph* gr = new TGraph(nAngle, angles, fluxes);
   gr->SetTitle("E_{#mu} > 1 GeV");
   gr->GetXaxis()->SetRangeUser(0, 89);
   gr->GetXaxis()->SetTitle("Zenith angle (#circ)");
   gr->GetYaxis()->SetTitle("Muon flux (m^{-2} s^{-1} sr^{-1})");
   gr->SetLineColor(kRed);
   gr->SetLineWidth(3);
   gr->SetMarkerColor(kRed);
   gr->Draw("ACP");

   c1->Print("muonFlux3.pdf");
}