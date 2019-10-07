class Node
{ 
    String key; 
    Node left, right; 
  
    public Node(String string) 
    { 
        key = string; 
        left = right = null; 
    } 
} 
  
class BinaryTree 
{ 
    Node root; 
  
    BinaryTree() 
    { 
        root = null; 
    } 
  
    void printPostorder(Node node) 
    { 
        if (node == null) 
            return; 
  
        printPostorder(node.left); 
        printPostorder(node.right); 
        System.out.print(node.key + " "); 
    } 
  
    void printInorder(Node node) 
    { 
        if (node == null) 
            return; 

        printInorder(node.left); 
        System.out.print(node.key + " "); 
        printInorder(node.right); 
    } 
  
    void printPreorder(Node node) 
    { 
        if (node == null) 
            return; 
  
        System.out.print(node.key + " "); 
        printPreorder(node.left); 
        printPreorder(node.right); 
    } 
  

    void printInorder()    
	{     
		printInorder(root);   
	} 
	
    void printPreorder()  	
	{    
		printPreorder(root);
	} 
	
    void printPostorder()  
	{     
		printPostorder(root);  
	} 

    public static void main(String[] args) 
    { 
        BinaryTree tree = new BinaryTree(); 
        tree.root = new Node("F"); 
        tree.root.left = new Node("B"); 
        tree.root.right = new Node("G"); 
        tree.root.left.left = new Node("A"); 
        tree.root.left.right = new Node("D"); 
        tree.root.left.right.left = new Node("C");
        tree.root.left.right.right = new Node("E");
        tree.root.right.right = new Node("I");
        tree.root.right.right.left = new Node("H");
  
        
        System.out.println("The inorder traversal of the binary tree is "); 
        tree.printInorder(); 
        
        System.out.println("\nPreorder traversal of binary tree is "); 
        tree.printPreorder(); 
  
        System.out.println("\nPostorder traversal of binary tree is "); 
        tree.printPostorder(); 
    } 
} 