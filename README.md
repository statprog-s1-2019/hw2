Statistical Programming - Homework 2
------------
Due on Friday October 18th by 11:59 pm.

<br/>

## Task 1 - Lego Sales Data

### Data

For this task you will be working with a synthetic data set of sales records for lego construction sets. We will assume that the original data was stored in a JSON format but a colleague has managed to import it into R as a list of lists (of lists). The code below will load a copy of the object, called `sales`, into your environment.

```r
sales = readRDS("data/lego_sales.rds")
```

The original JSON file is also available, as `data/lego_sales.json` in your repo, if you would prefer to examine a text based representation of the data.

The data is structured such that each entry in the top list represents a different purchaser. These list entries contain basic information about the purchaser (name, age, phone number, etc.) as well as their purchase history. Everyone in the data set has purchased at least one lego set but many have purchased more than one. The purchase histories are stored in the `purchases` element which is also a list of lists. Each entry within the `purchases` list reflects a different lego set which the customer purchased. Note that the customer may have purchased more than one copy of any particular set, this number is stored as `Quantity` within the purchase record.

<br/>

### Part 1 - Tidy the data

Your job here is to covert the `sales` object into a tidy data frame. Tidy in this case means each row should represents a separate purchase of a lego set by an individual and the columns should correspond to the keys in the JSON data. Duplicate columns should be avoided as much as possible and no data should be lost / ignored in the conversion.

Several guidelines / hints:

1. Be careful about making assumptions about the data - it is not as messy as real world data, but it is also not pristine and you are meant to run into several hiccups along the way.

2. Pay attention to types - the data frame you create should have columns that are of a type that matches the original data. 

3. Don't worry about duplicated data - since a customer can purchase multiple lego sets that customer's information may show up in multiple rows. This is fine and expected given the structure of the data. For the CS types: first normal form is ok in this case regardless of whatever your Databases professor may have told you.

4. Dealing with duplicate purchases - some customers purchased more than one copy of a particular lego set, for these individuals you can choose to code the purchase as multiple rows within the data frame or as a single row that also includes the quantity value. Either approach is fine, but your write up should discuss your choice. 

5. Avoid hard coding features of the data into your solutions (e.g. column names for your data frame should be determined at runtime as much as possible). 

6. Do not use magic numbers, always use column names whenever possible, similarly don't assume a specific size for the data (e.g. number of columns or rows) - all of these should be determined at run time.

<br/>


### Part 2 - Questions

This task will involve answering a number of questions about that data that will involve manipulating and summarizing the data frame you created in part 1. You are also welcome to use the original `sales` object if you believe that approach is more efficient for any particular question.

Only a one or two sentance write up is needed for these questions so long as you also include reasonably well documented code. Make sure that your code outputs your answer and only your answer. 

<br/>

1. What are the three most common first names of purchasers?

1. Which lego theme has made the most money for lego?

1. Do men or women buy more lego sets (per person) on average?

1. What are the five most popular hobbies of lego purchasers?

1. Which area code has spent the most money on legos?


## Task 2 - GitHub and dplyr

### Data

This is similarly structured data to what you were given in Task 1. In this case you are provided with details on all of the commits made to the dplyr package on GitHub since the beginning of the year. These data were obtained from the GitHub API and were originally formatted as JSON. Once again, we have preprocessed these data into a list of lists of lists and the resulting object can be read into R using the following code:

```r
commits = readRDS("data/dplyr_2019_commits.rds")
```

These data are somewhat more complicated than the lego data, but also most of the values provided are redundant and/or irrelevant for the task. Our goal for the task is to tidy up a subset of these data to construct a useful data frame which can then be used to answer several questions about the development of and contributors to dplyr.

Some relevant details about git / GitHub that will be useful for understanding / working with these data:

* git commits are uniquely identified by a hexidecimal hash called the `sha`

* git makes a distinction between who wrote the code and who committed it, the vast majority of the time these are the same and we will not worry about the cases where this is not true. For this task, you should assume that data stored under `author` should be used when determining who is responsible for a commit.

* Remember that a commit can involve a single file or multiple files, the reported `stats` are for all the files collectively, individual file's stats are availale within the `files` element.

* git / GitHub tracks the changes made to files in terms of additions and deletions - these changes might be as little as deleting a single character to as complicated as adding hundreds of lines of new functions. These statistics are stored for the commit as a whole in `stats` and on a per file basis within `files`.

* The data contains information on the commit history of the repository, including which commit is decended from which, while interesting none of this will be necessary for completing part 1 or 2 of this task. Examples of this type of data can be found the in the `parents` entry. 


### Part 1 - Tidy the data

Just like the previous task you are now expected to create a tidy data frame from these data. However, as mentioned previously there is a lot of information stored in this object that is not relevant or important for this task. Your data frame should not include every value from the commits object, instead it should only have columns that are relevant for answering the questions in part 2.

Your write up should detail your process for generating this tidy data frame as well as details about which columns you chose to include and why.

### Part 2 - Questions

1. Who are the top five contributors (in terms of the most commits) to dplyr in the last year?

2. Which four files have been modified in the most number of commits?

3. When is the most active time of the day for development on dplyr? More specifically, what is the average number of total changes made per commit for each hour of the day? Your result should exclude any commits that have a commit message containing the strings `"revdep"` or `"Merge"`.

4. Based on these data is there any "evidence" that commit message length is related to the complexity of the commit (as measured by the total number of changes in the commit)? Justify your answer.

5. Other than Romain Francois, which three contributors have worked on the most different files in the repository? In order words, who has the greatest number of unique file names among their commits.


<br/>

## Submission and Grading

This homework is due by *11:59 pm Friday, October 18th*. You are to complete the assignment as a group and to keep everything (code, write ups, etc.) on your team's github repository (commit early and often). All team members are expected to contribute equally to the completion of this assignment and group assessments will be given at its completion - anyone judged to not have sufficient contributed to the final product will have their grade penalized. While different teams members may have different coding backgrounds and abilities, it is the responsibility of every team member to understand how and why all code in the assignment works.

The final product for this assignment should be a single Rmd document (`hw2.Rmd`, a template of which is provided) that contains all code and text for the tasks described above. This document should be clearly and cleanly formated and present all of your writeup and results. Style, efficiency, formating, and readability all count for this assignment, so please take the time to make sure everything looks good and your text and code are properly formated. This document must be reproducible and I must be able to compile it with minimal intervention - documents that do not compile will be given a 0. 

<br/>


