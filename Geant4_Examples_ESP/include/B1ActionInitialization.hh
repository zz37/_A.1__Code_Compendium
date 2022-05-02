/*

  Archivo de ActionInitialization, 
  El cual instancia y registra a el kernel de Geant4 todas las clases
  de acción creadas por el usuario que se van a ejecutar

*/


/// \file B1ActionInitialization.hh
/// \brief Definition of the B1ActionInitialization class

#ifndef B1ActionInitialization_h
#define B1ActionInitialization_h 1

// definición del archivo cabezal
#include "G4VUserActionInitialization.hh"


/// Action initialization class.

/*

  def. de clase, donde G4VUserActionInitialization -> ActionInitialization es una clase derivada
  , esto se especifica en el (: public G4VUserActionInitialization) la cual la sub clase (ActionInitialization) 
  puede acceder a las funcionalidades de la clase base (G4VUserActionInitialization), pero solo los de modo de acceso
  público

  Las funciones miembro con "virtual" cuando se hace referencia a un objeto de clase derivada mediante un puntero o una referencia a la clase base,
  de modo que se llama a una función virtual para ese objeto y ejecutar la versión de la función de la clase derivada.
  Se utiliza para definir punteros y utilizar el polimorfismo.
  En el caso de que la función virtual = 0; es una función virtual pura.

*/


                                // este public es, public inheritance
class B1ActionInitialization : public G4VUserActionInitialization
{
  public:

  /* constuctor  
  con el fin de que siempre que se declara un  objeto de esta clase. 
  Su función sea crear e inicializar un objeto de esta clase (ActionInitialization).
  De modo que el constructor es una función miembro especial que se llama exactamente igual 
  que la clase y sirve para construir un nuevo objeto y asignar valores válidos a sus datos miembro.
  Características: Tiene el mismo nombre que la clase a la que pertenece. 
  No  tiene  tipo  de  retorno  (incluyendo  void),  por  lo tanto no retorna ningún valor. 
  Puede admitir parámetros como cualquier otra función. 
  No puede ser heredado. 
  No puede ser declarado const ni static. 
  Debe ser público.

  */
    B1ActionInitialization();
  /* destructor
  La misión más común de los destructores es liberar la memoria asignada por los constructores,
  */
    virtual ~B1ActionInitialization();

  // función miembro para la creación con el modo "Multi-thread"
    virtual void BuildForMaster() const;
  // función para la creacipon en modo estándar.
    virtual void Build() const;
};

//....oooOO0OOooo........oooOO0OOooo........oooOO0OOooo........oooOO0OOooo......

#endif

    
