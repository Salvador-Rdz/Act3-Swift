import Foundation

class FetchClass 
{
    //Variables
    var vector: [Int] = []
    //Functions
    func fetch(item: Int)->Int //Swift cannot have truly abstract classes
    {
        preconditionFailure("This method must be overridden")
    }
    func setV(v: [Int]) //Fills this class's vector with a predefined vector
	{
        self.vector = v
    }
    func setV(n:Int)->[Int] //Fills this class's vector with random numbers, receives the desired size of the array
	{
        var v:[Int] = [Int]()
        for _ in 0...(n-1) 
		{ //Using a linux platform
            v.append(random() % 100) //uses random, should be arc_random4() if on mac
        }
        return v
    }
    func getV()->[Int] //Returns this class's vector.
    {
        return self.vector
    }
    func showV() //Prints all of the values in the array.
	{
        let n:Int = self.vector.count-1
        var string = "Los valores del arreglo son: "
        for(index) in 0...n
		{
            string+=String(self.vector[index])
            string+=","
        }
        print(string)
    }
    func showF(n: Int) //Prints the position where the item to find is located.
	{
        if(n==(-1))
		{
			print("El valor no se encuentra en el vector")
		}
        else
        {
			print("El valor se encuentra en la posición  \(n)")
		}
    }
}
//Searches for a value in a vector using a binary type search
class binary: FetchClass, order
{
    override func fetch(item: Int) -> Int {
        var inicio: Int = 0
        var fin: Int = self.vector.count-1  
		var centro: Int = (inicio+fin)/2  
		//While the starting value of the setup is lower than the final position of the vector
        while(inicio < fin)
		{
			let valorCentro:Int = self.vector[centro] //Gets the current value of the center of the vector
            if(valorCentro == item)
			{
				return centro //Returns the position where the value was found
			}
			else
			{
				if(item < valorCentro)
				{
                	fin = centro
					centro = (inicio + fin)/2
            	} 
				else 
				{
                	inicio = centro;
					centro = (inicio + fin)/2;
            	}
			}  
        }
        return -1
    }
	func selection (v: [Int]) ->[Int]
	{
		var vector : [Int] = v
		var aux : Int
		for i in 0...vector.count-1
		{
			var m :Int = i;
            for (j) in 1...vector.count-1
			{
				if(vector[j]<vector[m])
				{
					m = j;
				}
			}
			aux = vector [i]
			vector [i] = vector [m]
			vector [m] = aux
        }
		return vector
	}
}
//Searches for a value in a vector using a secuential type search
class secuential: FetchClass
{
    override func fetch(item: Int) -> Int {
        let n:Int = self.vector.count-1
        for i in 0...n
		{
            if(self.vector[i] == item)
			{
				return i
			}
        }
        return -1
    }
}
protocol order //Protocol resembles Interfaces in java
{
	 func selection (v : [Int]) -> [Int]
}
//main
var vector: [Int] = [3,4,5,8,15,26,37,58,49] //predefined values for testing purposes
//Testing "secuential" class
print("Testing the secuential class")
var sec: secuential = secuential()
sec.setV(v: sec.setV(n: 50))
sec.showV()
print("Searching for 3")
sec.showF(n: sec.fetch(item: 3))
print("Testing the binary class")
//Testing "binary" class
var bin: binary = binary()
print ("Searching for 5")
bin.setV(v: vector)
bin.showV()
bin.showF(n: bin.fetch(item:5))