DROP VIEW IF EXISTS vw_dashboard_equipes;

CREATE VIEW vw_dashboard_equipes AS

SELECT
    t.team_id,
    t.team_name,

    -- Jogos disputados
    (
        SELECT COUNT(*)
        FROM matches m
        WHERE m.home_team_id = t.team_id
           OR m.away_team_id = t.team_id
    ) AS jogos,

    -- Gols marcados
    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.team_id = t.team_id
          AND me.event_type = 'Goal'
    ) AS gols_marcados,

    -- Gols sofridos
    (
        SELECT COUNT(*)
        FROM match_events me
        INNER JOIN matches m
            ON me.match_id = m.match_id
        WHERE me.event_type = 'Goal'
          AND (
                (me.team_id = m.home_team_id AND t.team_id = m.away_team_id)
             OR (me.team_id = m.away_team_id AND t.team_id = m.home_team_id)
          )
    ) AS gols_sofridos,

    -- Cartões amarelos
    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.team_id = t.team_id
          AND me.event_type = 'Yellow Card'
    ) AS cartoes_amarelos,

    -- Cartões vermelhos
    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.team_id = t.team_id
          AND me.event_type = 'Red Card'
    ) AS cartoes_vermelhos

FROM teams t;

DROP VIEW IF EXISTS vw_artilharia;

CREATE VIEW vw_artilharia AS

SELECT  
    t.team_id,
    sp.player_name,
    t.team_name,
    COUNT(*) AS total_gols
FROM match_events me
INNER JOIN teams t 
    ON me.team_id = t.team_id
INNER JOIN squads_and_players sp 
    ON me.player_id = sp.player_id
WHERE me.event_type = 'Goal'

GROUP BY sp.player_name, t.team_name

ORDER BY 
    total_gols DESC;

DROP VIEW IF EXISTS vw_man_of_the_match;

CREATE VIEW vw_man_of_the_match AS
SELECT
    team_id,
    player_of_the_match AS Jogador,
    COUNT(*) AS Quantidade_Premios
FROM match_team_stats
WHERE player_of_the_match IS NOT NULL 
GROUP BY player_of_the_match
ORDER BY Quantidade_Premios DESC;

--------- PARTIDAS_INCOMPLETAS ---------

DROP VIEW IF EXISTS vw_partidas;

CREATE VIEW vw_partidas AS

SELECT
    m.match_id,
    m.date,
    m.stage_id,

    ht.team_id AS home_team_id,
    ht.team_name AS mandante,

    at.team_id AS away_team_id,
    at.team_name AS visitante,

    m.home_score,
    m.away_score,

    CASE
        WHEN m.home_score > m.away_score THEN ht.team_name
        WHEN m.home_score < m.away_score THEN at.team_name
        ELSE 'Empate'
    END AS vencedor

FROM matches m

INNER JOIN teams ht
    ON m.home_team_id = ht.team_id

INNER JOIN teams at
    ON m.away_team_id = at.team_id;

DROP VIEW IF EXISTS vw_eventos;

---------- EVENTOS ---------
CREATE VIEW vw_eventos AS

SELECT
    m.match_id,
    m.date AS match_date,
    m.stage_id,

    ht.team_id AS home_team_id,
    ht.team_name AS mandante,

    at.team_id AS away_team_id,
    at.team_name AS visitante,

    m.home_score,
    m.away_score,

    CASE
        WHEN m.home_score > m.away_score THEN ht.team_name
        WHEN m.home_score < m.away_score THEN at.team_name
        ELSE 'Empate'
    END AS vencedor

FROM matches m

INNER JOIN teams ht
    ON m.home_team_id = ht.team_id

INNER JOIN teams at
    ON m.away_team_id = at.team_iD;

--------- PARTIDAS COMPLETAS ---------


DROP VIEW IF EXISTS partidas_completas;

CREATE VIEW partidas_completas AS

SELECT
    ht.team_id,
    m.match_id,
    m.date,
    stage_name,
    ht.team_id AS home_team_id,
    ht.team_name AS mandante,

    at.team_id AS away_team_id,
    at.team_name AS visitante,

    m.home_score,
    m.away_score,

    (m.home_score + m.away_score) AS total_gols,

    CASE
        WHEN m.home_score > m.away_score THEN ht.team_name
        WHEN m.home_score < m.away_score THEN at.team_name
        ELSE 'Empate'
    END AS vencedor,

    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.match_id = m.match_id
          AND me.team_id = ht.team_id
          AND me.event_type = 'Yellow Card'
    ) AS cartoes_amarelos_mandante,

    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.match_id = m.match_id
          AND me.team_id = ht.team_id
          AND me.event_type = 'Red Card'
    ) AS cartoes_vermelhos_mandante,

    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.match_id = m.match_id
          AND me.team_id = at.team_id
          AND me.event_type = 'Yellow Card'
    ) AS cartoes_amarelos_visitante,

    (
        SELECT COUNT(*)
        FROM match_events me
        WHERE me.match_id = m.match_id
          AND me.team_id = at.team_id
          AND me.event_type = 'Red Card'
    ) AS cartoes_vermelhos_visitante

FROM matches m

INNER JOIN teams ht
    ON m.home_team_id = ht.team_id

INNER JOIN teams at
    ON m.away_team_id = at.team_id

INNER JOIN matches_detailed md
    ON m.match_id = md.match_id

WHERE m.status = 'Completed'
ORDER BY m.date;