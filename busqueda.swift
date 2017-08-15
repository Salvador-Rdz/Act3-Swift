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
		{
            v.append(random() % 100)
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
class binary: FetchClass
{
    override func fetch(item: Int) -> Int {
        var inicio: Int = 0
        var fin: Int = self.vector.count-1  
		var centro: Int = (inicio+fin)/2  
		//While the starting value of the setup is lower than the final position of the vector
        while(inicio < fin)
		{
			var valorCentro:Int = self.vector[centro] //Gets the current value of the center of the vector
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
//main
var vector: [Int] = [1,2,3,4,5,6,7,8,9]
//Testing "secuential" class
var sec: secuential = secuential()
sec.setV(v: sec.setV(n: 50))
sec.showV()
sec.showF(n: sec.fetch(item: 3))
//Testing "binary" class
var bin: binary = binary()
bin.setV(v: vector)
bin.showV()
bin.showF(n: bin.fetch(item:3))