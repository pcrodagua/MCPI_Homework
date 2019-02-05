import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def calculate_sum_square_errors(teta_1, teta_0, x, y):
    error = 0
    for i in range(0, len(y)):
        x = x[i]
        y = y[i]
        error += (y - (teta_0 + teta_1 * x)) ** 2
    return error/float(len(x))


def gradient(teta_1, teta_0, x, y, learning_rate):
    # gradient descent
    teta_0_gradient = 0
    teta_1_gradient = 0

    M = float(len(x))

    for i in range(0, len(x)):
        x = x[i]
        y = y[i]
        teta_0_gradient += -(2/N) * (y - ((teta_1 * x) + teta_0))
        teta_1_gradient += -(2/N) * x * (y - ((teta_1 * x) + teta_0))
    new_b =

def calculate_gradient_descent(x, y, learning_rate, ini_teta_0, ini_teta_1, num_iterations):
    teta_0 = ini_teta_0
    teta_1 = ini_teta_1

    for i in range(num_iterations):
        teta_1, teta_0 = gradient(teta_1, teta_0, x, y, learning_rate)
    return [teta_1, teta_0]

def linear_regression(data):
    data_frame = pd.DataFrame(data)
    x = data_frame['x'].tolist()
    y = data_frame['y'].tolist()

    learning_rate = 0.0001

    # h(x) = teta_0 + teta_1*x

    ini_teta_0 = 0
    ini_teta_1 = 0
    num_iterations = 1000
    [ini_teta_0, ini_teta_1] = calculate_gradient_descent(x, y, learning_rate, ini_teta_0, ini_teta_1, num_iterations)




    plt.scatter(x, y)
    plt.show()


def calculate_cost_function(x, y, m, teta_0, teta_1):
    LSM = 0

    for i in range(m):


    COST_FUNCTION_J = 1/(2 * m) * LSM


if __name__ == '__main__':
    data = pd.read_csv('lrdata.csv')
    linear_regression(data)
