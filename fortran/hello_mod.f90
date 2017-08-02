module hello_mod

  implicit none

contains

  subroutine say_hello
    print('(A)'), "Hello World!"
  end subroutine say_hello

end module hello_mod
