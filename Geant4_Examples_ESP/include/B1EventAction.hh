/*

  Archivo de cabecera EventAction. 
  El cual define la metodología donde se especifíca la
  clase, las funciones de que accioones se van a desarrollar en cada evento de la
  simulación; al inicio y al final de cada evento (simulación) creadas por el usuario.

*/

/// \file B1EventAction.hh
/// \brief Definition of the B1EventAction class

#ifndef B1EventAction_h
#define B1EventAction_h 1

#include "G4UserEventAction.hh"
#include "globals.hh"

// declaración anticipada, ya que la clase usa punteros de la clase B1RunAction
class B1RunAction;

// Event action class
class B1EventAction : public G4UserEventAction
{
  public:
  // constructor que recibe un puntero (runAction) de tipo B1RunAction
    B1EventAction(B1RunAction* runAction);
  // destructor 
    virtual ~B1EventAction();

  // función virtual para los procesos al inicio de cada evento; recibe un puntero conts(event) de tipo G4Event
    virtual void BeginOfEventAction(const G4Event* event);
  // función virtual para los procesos al final de cada evento; recibe un puntero conts(event) de tipo G4Event
    virtual void EndOfEventAction(const G4Event* event);

  // función de tipo void donde se acumula la energía depositada.
    void AddEdep(G4double edep) { fEdep += edep; }

  private:
    B1RunAction* fRunAction;
    G4double     fEdep;
};

//....oooOO0OOooo........oooOO0OOooo........oooOO0OOooo........oooOO0OOooo......

#endif

    
