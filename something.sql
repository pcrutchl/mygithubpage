/* relevant users for a given context code */
SELECT
    user_data AS userData
FROM
    norm.tb_user u
    JOIN norm.tb_user_context uc ON u.network_id = uc.network_id
    AND u.user_code = uc.user_code
    AND uc.context_id = (
        SELECT
            context_id
        FROM
            norm.tb_context
        WHERE
            context_code = 'age-training'
    )
LIMIT
    5;

/* relevant messages for a given context code */
SELECT
    msg_data AS msgData
FROM
    norm.tb_message m
    JOIN norm.tb_user_context uc ON m.network_id = uc.network_id
    AND m.msg_code = uc.relevant_msg_code
    AND uc.context_id = (
        SELECT
            context_id
        FROM
            norm.tb_context
        WHERE
            context_code = 'age-training'
    )
LIMIT
    5;
