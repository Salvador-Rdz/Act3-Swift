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
    override func fetch(item: Int) -> Int 
	{
		selection()
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
	func selection () //Sorts the values in an array using the selection algorithm
	{
		var vector : [Int]=self.vector
		for i in 0...vector.count-1
		{
			var m :Int = i;
            for (j) in 1...vector.count-1
			{
				if(vector[j]<vector[m]) //checks if the lowest index is equal to the next index
				{
					m = j;
				}
			}
			//updates the array values
			swap(p1:i,p2:m)
        }
		self.vector = vector
	}
	func insertion() //Sorts the values in an array using the insertion algorithm
	{
		var vector : [Int]=self.vector
		var tmp : Int 
		var j : Int = 0
		var count : Int
		for i in 1...vector.count-1
		{
			count = i
			tmp=vector[i]
			count=count-1
			while(j>=0 && vector[j]>tmp) //moves throughout the index backwards while checking if the current value is higher than the vector of reference
			{
				vector[j+1]=vector[j] //Swaps the values on the left with the ones on the right
				j=j-1
			}
			vector[j+1]=tmp
		}
		self.vector = vector
	}
	func bubble () //Sorts the values in an array using the bubble algorithm
	{
		var vector : [Int]=self.vector
		//Moves throughout the array 
		for i in 0...vector.count-1
		{
			for j in 0...vector.count-i-1
			{
				if(vector[j+1]<vector[j]) //checks if the next value is smaller than the current value
				{
					swap(p1:j+1,p2:j) //Uses a predefined function to swap out values
				}
			}
        }
		self.vector = vector
	}
	func mergeSort (inicio:Int, fin:Int) //Sorts the values in an array using the mergeSort algorithm
	{
		var vector : [Int] = self.vector
		if(fin-inicio == 0 || fin - inicio == 1) //if the current evaluated list is of size 0 or 1, it means its already sorted.
		{
			
		}
		else
		{
			let pivot: Int = (inicio+fin)/2
			mergeSort(inicio:inicio, fin:pivot)
			mergeSort(inicio:pivot, fin:fin)
			let p1: Int = inicio
			let p2: Int = pivot
			let p3: Int = 0
			//an auxiliary array is created to save the in-order lists.
			var auxList : [Int] = []
			for i in 0...(fin-inicio) //Rudimentary, but is setup to create a specific sized array
			{
				auxList.append(0)
			}
			while(p1<pivot || p2<fin)
			{
				if(p1<pivot && p2<fin)
				{
					if(vector[p3+1]<vector[p2+1])
					{
						auxList[p3+1]=vector[p1+1] //In case they're smaller, they're swapped. 
					}
					else
					{
						auxList[p3+1]=vector[p2+1]
					}
				}
				else if (p1<pivot)
				{
					auxList[p3+1]=(auxList[p1])
				}
				else
				{
					auxList[p3+1] = auxList[p2+1]
				}
			}
		}
		self.vector = vector
	}
	func quickSort (inicio:Int, fin:Int) //Sorts the values in an array using the quicksort algorithm
	{
		var vector : [Int] = self.vector
		var i: Int = inicio
		var j: Int = fin
		let pivot = vector[inicio]
		while(i<=j) //while the start and end don't cross
		{
			//Moves throughout the vector comparing the values with the pivot, moving one by one, forwards or backwards
			while(vector[i]<=pivot && i<j)
			{
				i=i+1
			}
			while(vector[j]>pivot)
			{
				j=j-1
			}
			if(i<j)
			{
				swap(p1:j,p2:i) //Uses the swap function to exchange the values
				i=i+1
				j=j-1
			}
		}
		//
		vector[inicio] = vector [j]
		vector [j] = pivot
		//Uses recursivity to sort all of the values set by set
		if(inicio<j-1)
		{
			quickSort(inicio:inicio, fin:j-1)
		}
		if(i<fin)
		{
			quickSort(inicio:j+1, fin:fin)
		}
		self.vector = vector
	}
	func swap(p1:Int, p2:Int) //Utility function to swap two spaces between arrays
	{
		let tmp = self.vector[p1]
		self.vector[p1] = self.vector[p2]
		self.vector[p2]=tmp
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
protocol order //Protocol resembles Interfaces in java, implemented by the binary class
{
	func selection ()
	func bubble()
	func insertion()
	func mergeSort(inicio:Int, fin:Int)
	func quickSort(inicio:Int, fin:Int)
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
//bin.setV(10); //A random array can be generated by inputting an array size instead of a predefined vector.
//Test ordering methods to order the array
/*
bin.selection();
bin.bubble();
bin.insertion();
bin.mergeSort(inicio:0, fin:bin.vector.count-1);
bin.quickSort(inicio:0, fin:bin.vector.count-1);
*/
bin.showV()
bin.showF(n: bin.fetch(item:5))