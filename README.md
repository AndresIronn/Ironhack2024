# Music & Mental Health

![h](fotomusica.png)

## EDA
### Se obtuvo el dataframe de Kaggle y se lo importó en el Notebook. Luego de realizar algunas observaciones, se realizaron ciertos tratamientos. Entre ellos:

1) Se renombraron los títulos de las columnas siguiendo PEP-8: data.columns=[col.lower().replace(' ', '_') for col in data.columns]
2) Se utilizó una función para ver los nulos en porcentajes y se obtuvieron los siguientes valores.

def calculate_null_percentage(data):
    nulls=(data.isnull().sum() / len(data)) * 100
    return nulls.round(1).sort_values(ascending=False)
calculate_null_percentage(data)

bpm                             14.5
music_effects                    1.1
instrumentalist                  0.5
foreign_languages                0.5
while_working                    0.4
primary_streaming_service        0.1
composer                         0.1
age                              0.1
frequency_[video_game_music]     0.0
frequency_[pop]                  0.0
frequency_[r&b]                  0.0
frequency_[rap]                  0.0
frequency_[rock]                 0.0
timestamp                        0.0
anxiety                          0.0
depression                       0.0
frequency_[lofi]                 0.0
insomnia                         0.0
ocd                              0.0
frequency_[metal]                0.0
frequency_[hip_hop]              0.0
frequency_[latin]                0.0
frequency_[k_pop]                0.0
frequency_[jazz]                 0.0
frequency_[gospel]               0.0
...
exploratory                      0.0
fav_genre                        0.0
hours_per_day                    0.0
permissions                      0.0

Se imputaron los nulos de 'bpm' usando la mediana debido a la forma de su distribución (tenía mucha skewness). El resto se los eliminó debido a los porcentajes.

3) No había filas duplicadas, por lo que no se hizo nada respecto a ese tema
4) Luego se hicieron ciertas gráficas de Histogramas, Heatmaps (entre otras cosas) para tener una primera visualización de los datos.

![Heatmap1](heatmap_1.png)

![Histograms1](histograms1.png)

Se puede observar que hay correlaciones bastante bajas entre las variables numéricas, que hay cietos outliers y algunas distribuciones están lejos de una normal por lo que habría que hacerles tratamiento.

## Preprocessing

Se le aplicaron transformaciones logarítmicas o de raiz cuadrada (si era necesario, algunas quedaron sin transformar) a cada una de las variables numéricas para que queden con una forma más normal. También se hizo un tratamiento de Outliers.

Luego de los cambios, los histogramas quedaron así. Se puede ver que quedaron más normales:
![Histograms2](histograms2.png)

El Heatmap quedó escencialmente igual al anterior. Las correlaciones cambiaron en valores del entorno de un 5% o menos. El máximo antes daba 0.52 y ahora dio 0.48. Por lo que no es necesario droppear variables según este criterio.

Luego para las variables categóricas,
se hizo una función para eliminar las columnas que eran específicamente para un género. A modo de disminuir la cantidad de variables para el modelo. De todas formas, mantuve la de genero favorito que en cierta forma las contempla.

## Linear Regression Model

Elegí como variable target a la cantidad de horas de música escuchada por día.

X_num = data.select_dtypes(include=np.number).drop(columns=['hours_per_day'])
X_cat = data.select_dtypes(include=object)
Y = data['hours_per_day']

Apliqué transformaciones de normalización y estandarización. Usé el OneHotEncoder y luego las concatené para obtener la variable X
que se utilizó en el modelo. Usé un train, test, split y luego ejecuté el modelo:

X_train = sm.add_constant(X_train)
X_test = sm.add_constant(X_test)

# Fit the OLS model
model = sm.OLS(y_train, X_train).fit()

print(model.summary())

OLS Regression Results                            
==============================================================================
Dep. Variable:          hours_per_day   R-squared:                       0.996
Model:                            OLS   Adj. R-squared:                  0.260
Method:                 Least Squares   F-statistic:                     1.354
Date:                Sat, 15 Jun 2024   Prob (F-statistic):              0.471
Time:                        06:24:11   Log-Likelihood:                 933.17
No. Observations:                 537   AIC:                            -798.3
Df Residuals:                       3   BIC:                             1490.
Df Model:                         533                                         
Covariance Type:            nonrobust                                         
==============================================================================
                 coef    std err          t      P>|t|      [0.025      0.975]
------------------------------------------------------------------------------
const        147.8147    358.637      0.412      0.708    -993.527    1289.157
x1           -71.2701     53.089     -1.342      0.272    -240.224      97.684
x2          -144.5683    359.474     -0.402      0.715   -1288.573     999.437
x3           -11.1562     23.677     -0.471      0.670     -86.506      64.193
x4             0.3850     15.613      0.025      0.982     -49.302      50.072
x5            21.1271     24.273      0.870      0.448     -56.119      98.373
x6            -8.1567     21.631     -0.377      0.731     -76.995      60.682
x7         -2.745e-10   7.05e-10     -0.389      0.723   -2.52e-09    1.97e-09
x8            -0.1225      2.214     -0.055      0.959      -7.168       6.923
x9            -1.0493      2.292     -0.458      0.678      -8.343       6.245
x10        -2.664e-12   1.01e-11     -0.264      0.809   -3.48e-11    2.94e-11
...
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
[2] The input rank is higher than the number of observations.
[3] The smallest eigenvalue is 2.57e-31. This might indicate that there are
strong multicollinearity problems or that the design matrix is singular.




Se puede ver que el R2 dio demasiado bien, mientras que el ajustado dio muy bajo. Los p-valores dieron muy altos. Probablemente el modelo este sobreajustado. Hay demasiados p-valores altos, más de los que aparecen ahí. Probé irlos quitando y no mejoró mucho el resultado. También probé estandarizar y no hubo muchas mejoras. 


### VIF

  Variable	      VIF
0	age	        5.961786
1	bpm	        1.008772
2	anxiety	    7.997704
3	depression	5.336664
4	insomnia	2.996676
5	ocd	        2.201696

Se realizó un VIF pues no es suficiente con ver el Heatmap ya que solo muestra relaciones entre pares de variables.
No hubieron valores superiores a 10 que implicaran eliminación de variables. Así que esto tampoco sirve para mejorar el modelo.
Probé cambiar la variable target para ver si podía mejorarlo. 

### Modelo de Regresión utilizando 'anxiety' como target
Esta vez utilicé anxiety como variable dependiente y lo hice solo para las variables numéricas. Elegí anxiety viendo el Heatmap, parecía la que mejor podía funcionar. Aun así, logré obtener un R2 de 0.35, lo cual sigue siendo bastante bajo. Además de que no incluí
categóricas, por lo que el modelo no refleja bien al dataset.

### En ese momento me pregunté, será que este modelo no se ajusta bien a mis datos? Será que las relaciones no son lineales?

Decidí hacer una función que devuelve Scatter Plots de mi variable independiente original, hours_per_day, con el resto para ver que relació tenía. La función incluía la curva de mejor ajuste (la que minimiza el MSE). 

![Scatter Plots](scatters.png)

Se puede ver que muchas de las relaciones no son lineales (ignorando la que da 1 que es irrelevante). Esto indica que el modelo de Regresión Lineal no es el mejor. Se podría linealizar haciendo que ecuaciones como y=ax^3 sean y=a.z, siendo z=x^3. En ese caso la ecuación sería lineal en z. 

### Testeos Chi2

## Time Series Analysis
Se eligió otro dataset pues el anterior no funcionaba para un análisis de timepo. Este dataset trata sobre Spotify.
No fue necesario hacerle limpieza. 
Se quiere analizar como varía la cantidad de streams (cantidad de reproducciones de la canción) con el paso del tiempo.
Dado que el dataframe del modelo anterior era de fines del 2022, se decidió recortar este para que tengan el mismo período y puedan ser comparados. A su vez, el dataframe de Spotify tiene mas de 1 millon de filas, lo cual hace que el Prophet ande lento pero se hizo un análisis en chunks.


![Fines2022](cortito.png)

Del Forecast se puede ver que se agranda un poco el abanico pero no demasiado. Es decir, el modelo tiene buena capacidad predictiva. A su vez, en la parte de la gráfica que tiene datos reales, la tendencia es bastante constante, lo cual también da confianza para predecir. 


![Entero](total.png)

En cambio en este gráfico ya se ve una tendencia creciente. Tiene sentido porque al ir mejorando la tecnología, la gente tiende a escuchar más música.











