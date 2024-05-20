Data Structure
Queue
#include <iostream>
using namespace std;
#define size 10
int queue[size], front = -1, rear = -1, i, x;
void enqueue()
{
  if (rear == size - 1)
  {
    cout << "Queue is full\n";
    return;
  }

  rear++;
  cout << "Enter new item: ";
  cin >> x;
  queue[rear] = x;
  if (front == -1)
    front++;
}
void dequeue()
{
  if (front == -1)
    cout << "Q is empty\n";

  cout << "The first item: " << queue[front] << '\n';
  if (rear == front)
    front = rear = -1;
  else 
    front++;
}
bool isempty()
{
  if (front == -1)
  {
    cout << "Q is empty \n";
    return true;
  }
  else
    return false;
}
bool isfull()
{
  if (rear == size - 1)
  {
    cout << "Q is full\n";
    return true;
  }
  else
    return false;
}
void print()
{
  if (front == -1)
  {
    cout << "Q is empty\n";
  }
  for (i = front; i <= rear; i++)
  {
    cout << "queue[" << i << "]= " << queue[i] << '\n';
  }
  cout << "\n";
}
int main()
{
  enqueue();
  enqueue();
  enqueue();
  dequeue();
  print();
  cout << "Is Empty? " << isempty();
  dequeue();
  print();
}
Stack
#include<iostream>
using namespace std;
#define MAX 5
int stack[MAX] , top = -1;
void push(int item)
{
  if (top == MAX - 1)
  {
    cout << "Stack is full\n";
    return;
  }
  else
  {
    top++;
    stack[top] = item;
  }
}
int pop()
{
  int item;
  if (top == -1)
  {
    cout << "Stack is empty\n";
  }
  else
  {
    item = stack[top];
    top--;
  }
  return item;
}
bool isempty()
{
  return (top == -1);
}
bool isfull()
{
  return (top == MAX - 1);
}
void top_item()
{
  if (top == -1)
  {
    cout << "Stack is empty\n";
  }
  else
  {
    cout << "Top Item = " << top << '\n';
  }
}
void print ()
{
  if (top == -1)
  {
    cout << "Stack is empty\n";
    return;
  }
  else
  {
    for (int i = 0; i <= top; i++)
    {
      cout << stack[i] << ' ';
    }
    cout << endl;
  }
}
int main()
{
  cout << "is empty? " <<  isempty() << '\n';
  cout << "is full? " << isfull() << '\n';
  int x;
  for (int i = 0; i < 5; i++)
  {
    cout << "Enter X: ";
    cin >> x;
    push (x);
  }
  print();
  pop();
  print();
  cout << "is empty? " <<  isempty() << '\n';
  cout << "is full? " << isfull() << '\n';
}
Linked List
#include <iostream>
#include <cstdlib>
using namespace std;
struct node
{
  int data;
  node *ptr;
};
node *create(int n)
{
  node *head;
  head = (node *)malloc(sizeof(node));
  if (head == NULL)
  {
    cout << "No Memory Space\n";
    return 0;
  }
  else
  {
    head->data = n;
    head->ptr = NULL;
  }
  return head;
}
node *insert_first(node *p, int n)
{
  node *temp;
  temp = (node *)malloc(sizeof(node));
  if (temp == NULL)
  {
    cout << "No Memory Space\n";
    return 0;
  }
  else
  {
    temp->data = n;
    temp->ptr = p;
    p = temp;
  }
  return p;
}
node *insert_last(node *p, int n)
{
  node *temp, *current;
  temp = (node *)malloc(sizeof(node));
  if (temp == NULL)
  {
    cout << "No Memory Space\n";
    return 0;
  }
  else
  {
    current = p;
    while (current->ptr != NULL)
    {
      current = current->ptr;
    }
    temp->data = n;
    temp->ptr = NULL;
    current->ptr = temp;
  }
  return p;
}
node *delete_first(node *p)
{
  node *current = p;
  p = p->ptr;
  free(current);
  return p;
}
node *delete_last(node *p)
{
  node *prev = NULL, *current = p;
  while (current->ptr != NULL)
  {
    prev = current;
    current = current->ptr;
  }
  prev->ptr = NULL;
  free(current);
  return p;
}
int count(node *p)
{
  int counter = 0;
  while (p != NULL)
  {
    p = p->ptr;
    counter++;
  }
  return counter;
}
void print(node *p)
{
  while (p != NULL)
  {
    cout << p->data << '\n';
    p = p->ptr;
  }
}
int main()
{
  node *head = create(5);
  // 5
  head = insert_first(head, 1);
  // 1 5
  head = insert_last(head, 6);
  // 1 5 6
  head = insert_before(head, 50, 6);
  // 1 5 50 6
  head = delete_node(head, 90);
  // 1 5 50 6
  head = delete_node(head, 5);
  // 1 50 6
  head = delete_first(head);
  // 50 6
  head = delete_last(head);
  // 50

  print(head);
  cout << "Num of elements: " << count(head) << '\n';
}
Tree
#include<iostream>
using namespace std;
struct node
{
  int data;
  struct node *left;
  struct node *right;
};
struct node *newNode(int data)
{
  struct node *node = (struct node *)malloc(sizeof(struct node));
  node->data = data;
  node->left = NULL;
  node->right = NULL;

  return (node);
}
void Inorder(struct node *node)
{
  if (node == NULL)
    return;

  Inorder(node->left);
  cout << node->data;
  Inorder(node->right);
}
void Preorder(struct node *node)
{
  if (node == NULL)
    return;

  cout << node->data;
  Preorder(node->left);
  Preorder(node->right);
}
void Postorder(struct node *node)
{
  if (node == NULL)
    return;

  Postorder(node->left);
  Postorder(node->right);
  cout << node->data;
}
int main()
{
  struct node *root = newNode(1);
  root->left = newNode(2);
  root->right = newNode(3);
  root->left->left = newNode(4);
  root->left->right = newNode(5);
  root->right->left = newNode(6);
  root->right->right = newNode(7);


  cout << "\nInorder traversal of binary tree is \n";
  Inorder(root);

  cout << "\nPreorder traversal of binary tree is \n";
  Preorder(root);
  Queue & Stack Using Linked List
Queue
#include <iostream>
using namespace std;
struct node
{
  int data;
  node * ptr;
};
node * create(int data)
{
  node * front = (node *) malloc(sizeof(node));
  if(front == NULL)
  {
    cout << "No memory Space\n";
  }
  else
  {
    front->data = data;
    front->ptr = NULL;
  }
  return front;
}
node * Enqueue(node * front, int data)
{
  node * New = (node *) malloc(sizeof(node));
  if(New == NULL)
  {
    cout << "No Memory Space\n";
  }
  else
  {
    New->data = data;
    New->ptr = front;
    front = New;
  }
  return front;
}
node * Dequeue(node * front)
{
  node *prev = NULL, *rear = front;
  while(rear->ptr != NULL)
  {
    prev = rear;
    rear = rear->ptr ;
  }
  prev->ptr = NULL;
  free(rear);
  return front;
}
void print(node * front)
{
  cout << "rear--> ";
  while(front != NULL)
  {
    cout << front->data << ' ';
    front = front->ptr;
  }
  cout << "<--front\n";
}
int count(node * front)
{
  int counter = 0;
  while(front != NULL)
  {
    counter++;
    front = front->ptr;
  }
  return counter;
}
int main()
{
  node * Q = create(10);

  Q = Enqueue(Q, 20);
  Q = Enqueue(Q, 30);
  Q = Enqueue(Q, 40);
  print(Q);

  Q = Dequeue(Q);
  Q = Dequeue(Q);
  print(Q);
}
Stack
#include<iostream>
using namespace std;
struct node
{
  int data;
  node * ptr;
};
node * create(int data)
{
  node * top = (struct node *)malloc(sizeof(node));
  if(top == NULL)
  {
    cout << "No memory space\n";
  }
  else
  {
    top->data = data;
    top ->ptr = NULL;
  }
  return top;
}
node * Push(node * top, int data)
{
  node *New = (node*)malloc(sizeof(node));
  if(New == NULL)
  {
    cout << "No memory Space\n";
  }
  else
  {
    New->data = data;
    New->ptr = top;
    top = New;
  }
  return top;
}
node * Pop(node * top)
{
  node * current = top;
  top = top->ptr;
  free(current);
  return top;
}
void print(node * top)
{
  cout << "Top--> ";
  while(top != NULL)
  {
    cout << top->data << ' ';
    top = top->ptr;
  }
  cout << "\n";
}
int count(node * top)
{
  int counter = 0;
  while(top != NULL)
  {
    counter++;
    top = top->ptr;
  }
  return counter;
}
bool isEmpty(node * top)
{
  return (top == NULL);
}
int main()
{
  node * Stack = create(10);

  Stack = Push(Stack, 20);
  Stack = Push(Stack, 30);
  Stack = Push(Stack, 40);
  print(Stack);

  cout << "Num of Elements: " << count(Stack) << '\n';

  Stack = Pop(Stack);
  Stack = Pop(Stack);
  print(Stack);

  cout << "Is empty? " << isEmpty(Stack) << '\n';
}

  cout << "\nPostorder traversal of binary tree is \n";
  Postorder(root);
  return 0;
}
