public class BinarySearchTree
{
	class Node
	{
		int key;
		Node left,right;
		
		public Node(int item)
		{
			key = item;
			left = null;
			right = null;
		}
	}
	
	Node root;
	
	BinarySearchTree()
	{
		root = null;
		
		void insert(int key)
		{
			root = insertRec(root, key);
		}
		
		Node insertRec(Node root, int key)
		{
			if(root == null)
			{
				root = new Node(key);
				return root;
			}
			
			if(key < root.key)
			{
				root.left = insertRec(root.left, key);
			}
			else if(key < root.key)
			{
				root.left = insertRec(root.left, key);
			}
			
			return root;
		}

		void inorder() 
		{
			inorderRec(root); 
		}

			
		void inorderRec(Node root) 
		{
			if (root != null) 
			{
				inorderRec(root.left);
				System.out.println(root.key);
				inorderRec(root.right);
			} 
		}
		
		void deleteKey(int key)
		{ 
			root = deleteRec(root, key);
		}
		
		Node deleteRec(Node root, int key)
		{
			if(root == null)
				return root;
			if(key < root.key)
				root.left = deleteRec(root.left, key);
			else if(key > root.key)
				root.right = deleteRec(root.left, key);
			else
			{
				if(root.left == null)
					return root.right;
				else if(root.right == null)
					return root.left;
				
			root.key = minimumElement(root.right);
			
			root.right = deleteRec(root.right, root.key);
			}
		}
		
		public static TreeNode minimumElement(TreeNode root)
		{
			if(root.left == null)
			{
				return root;
			}
			else
			{
				return minimumElement(root.left);
			}
		}
		public static TreeNode maximumElement(TreeNode root)
		{
			if(root.right == null)
			{
				return root;
			}
			else
			{
				return minimumElement(root.right);
			}
		}

	}
	
public static void main(String[] args)
{
	BinarySearchTree tree = new BinarySearchTree();
	
	tree.insert(65);
	tree.insert(100);
	tree.insert(70);
	tree.insert(56);
	tree.insert(50);
	tree.insert(90);
	tree.insert(92);
	tree.insert(84);
	tree.insert(43);
	tree.insert(94);
	tree.insert(87);
	tree.insert(34);
	
	tree.inorder();
	
	tree.deleteKey(90)
	
	tree.inorder();
	
	
	System.out.println(tree.minimumElement());
	System.out.println(tree.maximumElement());
}
}



