import os


def hello_wolrd() -> str:
    """Hello world
    description: Prints Hello world to the console.
    Returns:
        str: Hello world
    """
    print("Hello world")
    return "Hello world"


if __name__ == "__main__":
    hello_wolrd()
    print(os.getcwd())
