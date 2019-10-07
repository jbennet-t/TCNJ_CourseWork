import java.util.*;
import java.util.Scanner;

public class Lab2
{
	
	public static void main(String[] args)
	{
		LinkedList storage = new LinkedList();
		int[] arrStorage = new int[10];
		
		Scanner sc = new Scanner(System.in); 
		
		//entering info
		for(int i = 0; i<9; i++)
		{
			System.out.println("Enter an integer");
			int b = sc.nextInt();
			storage.add(b);
			arrStorage[i] = b;
		}
		
		//printing out contents of linkedlist
		System.out.println("The contents of the LinkedList are: ");
		for(int i = 0; i< storage.size(); i++)
		{
			System.out.println(storage.get(i) + " is stored at: index " + i);
		}
		
		//Linear Search
		System.out.println("The linkedlist will now be searched for the number 49. If the ouput is a number, that is the index. Otherwise it will be -1");
		int searchKey = 49;
		int y = 0;
		
			for(int i = 0; i < storage.size(); i++)
			{
				if(arrStorage[i] == searchKey)
				{
					y = i;
					break;
				}
				else{
					y = -1;
				}
			}
		System.out.println(y);
		
		
		//Selection sort
		int intsmallerNumber;
		int smallerNumber;
		int index;
		
			for (int i= 0; i< arrStorage.length-1; i++)
			{  
				index = i;  
				for (int j = i+ 1; j < arrStorage.length; j++)
				{  
					if (arrStorage[j] < arrStorage[index])
					{ 
						index = j;
					}  
				}  
				intsmallerNumber= arrStorage[index]; 
				arrStorage[index] = arrStorage[i];  
				arrStorage[i] = smallerNumber;  
			}
			
		System.out.println("Selection sort performed. The contents of the LinkedList are now: ");
		for(int i = 0; i< arrStorage.length; i++)
		{
			System.out.println(arrStorage[i] + " is stored at: index " + i);
		}
			
		//Binary search
		
		int first = 0;
		int last = arrStorage.length;
		int key = 98;
		int mid = (first+last)/2;
		while(first <= last)
		{
			if(arrStorage[mid] < key)
			{
				first = mid + 1;
			}
			else if(arrStorage[mid] == key)
			{
				System.out.println("Element found at index: " + mid);
				break;
			}
			else
			{ 
				last = mid -1;
			}
			mid = (first+last)/2;
		}
		if(first > last)
		{
			System.out.println(-1);
		}
		
			
		
		
	
		
		
		
	}
	
	/*
	public static void selectionSort(int[] c)
	{  
		for (int i= 0; i< arr.length-1; i++)
			{  
				int index = i;  
				for (intj = i+ 1; j < arr.length; j++)
				{  
					if (arr[j] < arr[index])
					{ 
						index = j;
					}  
				}  
				intsmallerNumber= arr[index]; 
				arr[index] = arr[i];  
				arr[i] = smallerNumber;  
			}  
	}  
	*/
	
	/*
	public static int LinearSearch(int[] a, int key)
	{
			int size = a.length;
			for(int i = 0; i < 9; i++)
			{
				if(a[i] == key);
			{
				return i;
			}
		}
		return -1;
	}
	*/
	
}