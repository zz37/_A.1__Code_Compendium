/*

  Archivo de cabecera DetectorConstruction, 
  El cual define las funciones miembro donde se especifica las 
  geometrías de el mundo, el detector geometrías, materiales,  etc. 
  creadas por el usuario.

*/

/// \file B1DetectorConstruction.hh
/// \brief Definition of the B1DetectorConstruction class

#ifndef B1DetectorConstruction_h
#define B1DetectorConstruction_h 1

#include "G4VUserDetectorConstruction.hh"
#include "globals.hh"


// delcaracion anticipada para el uso por referencias o punteros de G4VPhysicalVolume y G4LogicalVolume
class G4VPhysicalVolume;
class G4LogicalVolume;

// Detector construction class to define materials and geometry.
// la clase de B1DetectorConstruction hereda las propiedades de G4VUserDetectorConstruction de forma pública
class B1DetectorConstruction : public G4VUserDetectorConstruction
{
  public:
  // constructor
    B1DetectorConstruction();
  // destructor
    virtual ~B1DetectorConstruction();

  // función virtual donde se define el código donde se construye el ususario su geometría
    virtual G4VPhysicalVolume* Construct();
  // funcipon donde se recupera el volumen de puntuación
    G4LogicalVolume* GetScoringVolume() const { return fScoringVolume; }
// datos miembros privados
  protected:
    G4LogicalVolume*  fScoringVolume;
};

//....oooOO0OOooo........oooOO0OOooo........oooOO0OOooo........oooOO0OOooo......

#endif

