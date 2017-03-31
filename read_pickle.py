import pickle

if __name__ == '__main__':
    dic = pickle.load(open("nulls.pickle", "rb"))
    print(dic)
