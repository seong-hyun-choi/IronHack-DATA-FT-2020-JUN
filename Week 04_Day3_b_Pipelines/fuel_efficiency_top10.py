import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

year = int(input('Enter the year: '))
title = f'Top 10 Manufacturers by Fuel Efficiency {str(year)}'

def acquire():
    data = pd.read_csv('./data/vehicles.csv')
    return data

def wrangle(df):
    mask = data['Year'] == year
    filtered = data.loc[mask,:]
    return filtered

def analyze(df):
    df_result = filtered.groupby(by='Make', as_index=False).agg({'Combined MPG': 'mean'}) \
                       .sort_values(by='Combined MPG', ascending=False)
    results = df_result.head(10).reset_index(drop=True)
    return results

def visualize(df):
    fig, ax = plt.subplots(figsize=(8, 5))
    barchart = sns.barplot(data=results, x='Make', y='Combined MPG')
    plt.title(title + "\n", fontweight='bold',fontsize=15)

    #annotate axis = seaborn axis
    for p in barchart.patches:
        barchart.annotate("%.2f" % p.get_height(),
                (p.get_x() + p.get_width() / 2., p.get_height()),
                 va='center',
                 fontsize=12, color='gray',
                 xytext=(0, 20),
                 textcoords='offset points')

    return barchart

def save_viz(barchart):
    fig = barchart.get_figure()
    fig.savefig(title + '.png')

if __name__ == '__main__':
    data = acquire()
    filtered = wrangle(data)
    results = analyze(filtered)
    barchart = visualize(results)
    save_viz(barchart)
