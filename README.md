<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">Offline Assesment Solution</h3>
</div>

<!-- ABOUT THE PROJECT -->
#### As part of the offline assessment I have provided solutions to the questions using SQL and Pandas both.
**Solution by: Romesh Borawake (borawakeromesh@gmail.com)**

---
Table under consideration is Sales with the sample format given below:
```
Sale_date, Country, Category, product, sales
Jan-2021, USA , Retail, UUID1, 10000
Jan-2021, USA, Healthcare, UUID2, 2000
Jan-2021, Canada, Retail, UUID3, 30000
Jan-2021, Canada, Hospitality, UUID4, 5000
Feb-2021, USA , Retail, UUID5, 10000
Feb-2021, USA, Healthcare, UUID6, 2000
Feb-2021, Canada, Retail, UUID7, 30000
Feb-2021, Canada, Hospitality, UUID8, 5000
```

Questions:

1.Top 3 categories within every country based on total sales in the current year.
- Output should be in this format (Country, Category, Total sales)

2.Total sales of products sold in both Feb & Jan , Total sales of products sold ONLY in Jan, Total sales of products sold ONLY in Feb.
- Output should be in this format (jan_feb_sales, jan_sales, feb_sales)

3.In the query written in question #1 what are the partitions and indexes you would create for best performance?

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- Solution Using SQL -->
### Solution Using SQL
Detailed Solution can be checked at: https://github.com/romeshb/Offline-Assessment/blob/master/Offline_Assignment_SQL_Solution.sql

#### Q1. Answer
- ![image](https://user-images.githubusercontent.com/57130659/163727298-05e0c88e-db49-4eb8-80c6-f9e8861ea952.png)

#### Q2. Answer
- ![image](https://user-images.githubusercontent.com/57130659/163727360-f89f9934-7219-4b29-b5a9-d98952fe73b8.png)

#### Q3. Answer
- The Partitions I created were Sale_year, Country and Category for best perfomance,
- because, We can say that Sale year is least Heterogeneous in the current table, 
- followed by Country and then by Category.


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- Solution Using Pandas -->
### Solution Using Pandas
Detailed Solution can be checked at: https://github.com/romeshb/Offline-Assessment/blob/master/Offline_Assignment_Pandas_Solution.ipynb

#### Q1. Answer
- ![image](https://user-images.githubusercontent.com/57130659/163727505-15e8332d-b784-4971-9b87-3174de961aac.png)

#### Q2. Answer
- ![image](https://user-images.githubusercontent.com/57130659/163727525-058e5500-47c0-4e65-810a-d2c30518c54f.png)

#### Q3. Answer
- The Partitions I created were Sale_year, Country and Category for best perfomance,
- because, We can say that Sale year is least Heterogeneous in the current table, 
- followed by Country and then by Category.

<!-- CONTACT -->
## Contact

Your Name - borawakeromesh@gmail.com

Project Link: [https://github.com/romeshb/Offline-Assessment](https://github.com/romeshb/Offline-Assessment)

<p align="right">(<a href="#top">back to top</a>)</p>

