#medimos las cosas del 1 a 10 
#tres categorias baja=1-4 media 5-7 alta:8-10
import time

class Suelo:
	def __init__(self, dureza, porosidad):
		self.dureza=dureza
		self.porosidad=porosidad

	def esPedroso(self):
		return self.dureza >7 and self.porosidad<5

	def esPolvoso(self):
		return self.dureza<5 and self.porosidad>7

	def esIntermedio(self):
		return 4<self.dureza and self.dureza<8 and 4<self.porosidad and self.porosidad<8

class BrazoEscabador:
	def __init__(self):
		self.escabando = False
	
	def escabar(self, suelo):
		if not self.escabando:
			self.escabando=True
			if suelo.esPedroso():
				self.escabarSuelo('horario',150,10,'antihorario', 150, 10)
			elif suelo.esPolvoso():
				self.escabarSuelo('antihorario',10,5,'horario', 100, 5)
			elif suelo.esIntermedio():
				self.escabarSuelo('horario',150,5,'antihorario', 100, 10)
			else:
				raise Exception('error: tipo de suelo desconocido')
			self.escabando=False	

	def escabarSuelo(self, dir1, vel1, t1, dir2, vel2,  t2):
		self.girarMecha(dir1, vel1, t1)
		self.cerrarPinza()
		self.girarMecha(dir2, vel2, t2)


	def girarMecha(self, sentido, velocidad, tiempo):
		print('girando en',sentido,'con una velocidad de',velocidad,'rpm')
		time.sleep(2*tiempo)
		print('termino de girar')

	def cerrarPinza(self):			
		print('objeto agarrado')

def main():
	brazo = BrazoEscabador()
	sueloPed= Suelo(8,3)
	sueloPolv= Suelo(3,8)
	sueloInt = Suelo(5,5)
	sueloRaro= Suelo(9,9)
	brazo.escabar(sueloPed)
	brazo.escabar(sueloPolv)
	brazo.escabar(sueloInt)
	brazo.escabar(sueloRaro)


if __name__=='__main__':
	main()