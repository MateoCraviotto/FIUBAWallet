# language: es
Característica: Como usuario quiero poder crear grupos con otros usuarios para poder repartir gastos

  @local
  Escenario: 5.1 Usuario registrado quiere crear un grupo con una persona
    Dado que soy un usuario registrado
    Y existe un usuario con el nombre "juancho"
    Cuando quiero crear un grupo con el nombre "grupo" con el usuario "juancho"
    Entonces veo el mensaje "Grupo creado"
    Y el grupo "grupo" se crea

  @local
  Escenario: 5.2 Usuario registrado quiere crear un grupo con dos personas
    Dado que soy un usuario registrado
    Y existe un usuario con el nombre "juancho"
    Y existe un usuario con el nombre "pedro"
    Cuando quiero crear un grupo con el nombre "amigos" con los usuarios "juancho" y "pedro"
    Entonces veo el mensaje "Grupo creado"
    Y el grupo "amigos" se crea
