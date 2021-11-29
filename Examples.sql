--SELECT p.Title, p.CharCount, p.TEXT, a.Name
--	FROM Poem p
--	LEFT JOIN Author a ON p.AuthorId = a.Id
--	Where p.Text Like '%bear%'

--SELECT p.Title, p.CharCount, p.TEXT, e.Name 'Emotion Name', a.Name 'Author Id'
--	FROM Poem p
--	JOIN Author a ON a.Id = P.AuthorId
--	JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	JOIN Emotion e ON e.Id = pe.EmotionId
--	WHERE e.Name LIKE 'Sadness'
--	ORDER BY p.CharCount ASC

SELECT COUNT(*)
	FROM Poem p
	JOIN Author a ON a.Id = P.AuthorId
	JOIN PoemEmotion pe ON pe.PoemId = p.Id
	JOIN Emotion e ON e.Id = pe.EmotionId
	--WHERE e.Name LIKE 'Fear'
