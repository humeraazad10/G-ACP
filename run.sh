#!/bin/bash
python iFeature/iFeature.py --file $1 --type PAAC

echo "from pickle import load
import pandas as pd

seq_feat = pd.read_table('encoding.tsv')
names = seq_feat['#']
seq_feat.drop('#', axis=1, inplace=True)

model = load(open('G-ACP', 'rb'))
pred = model.predict(seq_feat)
result = pd.DataFrame({'Sequence':names, 'Prediction':pred})
result.to_csv('Result.csv', index=None)" >> process.py
python process.py
rm process.py


