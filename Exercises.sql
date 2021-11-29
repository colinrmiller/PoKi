--What grades are stored in the database?
--SELECT NAME
--	FROM Grade
--	GROUP BY Name

--What emotions may be associated with a poem?
--SELECT NAME
--	FROM Emotion
--	GROUP BY Name

--How many poems are in the database?
--SELECT COUNT(*) 'Number Of Poems'
--	FROM Poem p

--Sort authors alphabetically by name. What are the names of the top 76 authors?
--SELECT TOP 76 Name
--	FROM Author
--	ORDER BY Name 
	
--Starting with the above query, add the grade of each of the authors.
--SELECT TOP 76 a.Name, g.Name
--	FROM Author a
--	JOIN Grade g ON a.GradeId = g.Id
--	ORDER BY a.Name 

--Starting with the above query, add the recorded gender of each of the authors.
--SELECT TOP 76 a.Name, gr.Name, ge.Name
--	FROM Author a
--	JOIN Grade gr ON a.GradeId = gr.Id
--	JOIN Gender ge ON a.GenderId = ge.Id
--	ORDER BY a.Name 

--What is the total number of words in all poems in the database?
--SELECT SUM(CharCount) 'Global Char Count'
--	FROM Poem

--(8) Which poem has the fewest characters?
--SELECT TOP 1 Title, CharCount
--	FROM Poem
--	ORDER BY CharCount ASC

--How many authors are in the third grade?
--SELECT COUNT(*) 'Total Students in Grade 3'
--	FROM Author a
--	JOIN Grade g ON a.GradeId = g.Id
--	WHERE g.Name LIKE '%3%'

-- (10) How many total authors are in the first through third grades?
--SELECT COUNT(*) 'Total Students Grades 1-3'
--	FROM Author a
--	JOIN Grade g ON a.GradeId = g.Id
--	WHERE g.Name LIKE '%[1-3]%'


--(11) What is the total number of poems written by fourth graders?
--SELECT COUNT(*) 'Total Poems Written By Grade 4'
--	FROM Author a
--	JOIN Grade g ON a.GradeId = g.Id
--	JOIN Poem p ON a.Id = p.AuthorId
--	WHERE g.Name LIKE '%4%'

--(12) How many poems are there per grade?
--SELECT COUNT(p.Id) 'Total Poems By Grade Level', g.Name
--	FROM Author a
--	JOIN Grade g ON a.GradeId = g.Id
--	JOIN Poem p ON a.Id = p.AuthorId
--	GROUP BY g.Name

--(13) How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--SELECT COUNT(a.Id) 'Total Authors By Grade Level', g.Name
--	FROM Author a
--	JOIN Grade g ON g.Id = a.GradeId
--	GROUP BY  g.Name, a.GradeId

--(14) What is the title of the poem that has the most words?
-- TODO !!! Doesn't count words, counts chars !!!
SELECT TOP 1 Title 'Poem With the Most Words', WordCount
	FROM Poem
	ORDER BY WordCount DESC

SELECT TOP 1 Title 'Poem With the Most Words (2)', COUNT( STRING_SPLIT (Text, ' '))
	FROM Poem
	ORDER BY WordCount DESC

--Which author(s) have the most poems? (Remember authors can have the same name.)
-- !!! NOT FINISHED !!!
--SELECT Count(*) 'Number of Poems by Author', a.Name
--	FROM Poem p
--	JOIN Author a ON p.AuthorId = a.Id
--	Group BY p.AuthorId, a.Name
--	ORDER BY Count(*) DESC 

--How many poems have an emotion of sadness?
--SELECT COUNT(*)'Number of Poems Associated With "Sadness"'
--	FROM Poem p
--	JOIN Author a ON a.Id = P.AuthorId
--	JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	JOIN Emotion e ON e.Id = pe.EmotionId
--	WHERE e.Name LIKE 'Sadness'

--How many poems are not associated with any emotion?
--SELECT COUNT(*) 'Number of Poems Not Associated With an Emotion'
--	FROM Poem p
--	JOIN Author a ON a.Id = P.AuthorId
--	LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	LEFT JOIN Emotion e ON e.Id = pe.EmotionId
--	WHERE pe.EmotionId is null

--Which emotion is associated with the least number of poems?
--SELECT COUNT(*) 'Number of Poems By Associated Emotion', e.Name 'Emotion'
--	FROM Poem p
--	JOIN Author a ON a.Id = P.AuthorId
--	JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	JOIN Emotion e ON e.Id = pe.EmotionId
--	GROUP BY e.Name

--Which grade has the largest number of poems with an emotion of joy?
--SELECT COUNT(*) 'Number of Poems Associated with "Joy" By Grade Level', gr.Name 'Grade'
--	FROM Poem p
--	JOIN Author a ON a.Id = P.AuthorId
--	JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	JOIN Emotion e ON e.Id = pe.EmotionId
--	JOIN Grade gr ON gr.Id = a.GradeId
--	WHERE e.Name LIKE 'Joy'
--	GROUP BY gr.Name

--Which gender has the least number of poems with an emotion of fear?
--SELECT COUNT(*) 'Number of Poems Associated with "Fear" By Gender', ge.Name 'Gender'
--	FROM Poem p
--	JOIN Author a ON a.Id = P.AuthorId
--	JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	JOIN Emotion e ON e.Id = pe.EmotionId
--	JOIN Gender ge ON ge.Id = a.GenderId
--	WHERE e.Name LIKE 'Fear'
--	GROUP BY ge.Name
--	ORDER BY COUNT(*) ASC
