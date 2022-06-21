Program QuotientDifference

!1- Ingresa el grado del polinomio
!2- Ingresa los coeficientes de forma ordenada
!3- Comienza QD
    !i-Ejecuta primeras iteraciones


Implicit none
Integer:: n, i, iter, maxiter
Real, allocatable:: a(:), e(:), q(:)
Real:: error, tol

! COMIENZA EL PROGRAMA

Write (*,*) 'Ingrese el grado del polinomio completo'
Read (*,*) n 

Allocate (a(n))
Allocate (q(n))
Allocate (e(n))

CALL ingresa_coeficientes(i,n,a)

!Write (*,*) 'Ingrese la tolerancia'               !!Aca esta en rojo porque mientras lo vas probando es más facil ya dejarlos puestos
                                                    ! están más abajo los valores.
   !Read(*,*) tol
   !error=2*tol
!Write (*,*) 'Ingrese la cantidad maxima de iteraciones'
   !Read(*,*) maxiter

Write(*,*) a(n-1)
Write(*,*) a(n)
Write(*,*) a(0)
Write(*,*) 'aaaaaaaaaaaa' !para ver si funciona

    
!COMIENZA QD
q=0.
e(n)=0.
e(0)=0.

!ITERACIÓN 0
!CALL Iteracion_cero(q,n,e,i) !Todavía no existe esta subrutina, la puse porque por ahi la idea era ir llamando subrutinas pero
                              ! creo que es mejor que en el programa se pueda explicar todo sin tener que ir y volver de la seccion 
                              !Contains, para poder darle mas ritmo al explicarñ
 q(1)=-(a(n-1))/(a(n))
    do i=1, n-1
      e(i)=a(n-i-1)/a(n-i)
    end do
Write(*,*)' '

maxiter=20
iter=0
tol=0.0005
error=2*tol
!Resto de las iteraciones
Do while (error>tol .and. maxiter>iter)

    Do i=1, n                  !Calculo la fila de entera en cada iteración
       q(i)=e(i)-e(i-1)+q(i)     
    End do
    
    Do i=1, n-1                !Como e(0)=e(n)=0 siempre, uso esos límites en el ciclo
       e(i)=e(i)*q(i+1)/q(i)   ! Hay un error de tipeo en el pdf que figura q(i-1) pero en la tabla utiliza q(i+1), sino no da
    end do
   
!Write(*,*) q
!Write(*,*) e  !no me escribe e(0) pero siempre es igual a cero asi que meh, pasa que por defecto arranca con el elemento 1
               !igual solo esto era solo para chequear que estén bien los resultados
!Write(*,*)
     iter=iter+1
     error=maxval(abs(e))
end do








CONTAINS

SUBROUTINE ingresa_coeficientes(i,n,a)
integer:: i,n
real:: a(n)

Write(*,*) 'Ingrese los coeficientes'
Do i=0, n                               !Ojo que termina en cero para que sea coherente con x**0 y su coeficiente sea a_0
  Write(*,*) 'a_',i
   read(*,*) a(i)
       ! If (a(i)==0) then 
        !  Write(*,*) 'El coeficiente debe ser distinto de cero, ingrese otro valor'
         ! read(*,*) a(i)
        !end if
end do

END SUBROUTINE


End program