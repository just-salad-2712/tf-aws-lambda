import json

def lambda_handler(event, context):
    """
    A simple "Hello, world!" function.

    Parameters
    ----------
    event: dict, optional
        A dictionary of event data.
    context: object, optional
        An object containing runtime information.

    Returns
    -------
    dict
        A dictionary with the response.
    """

    return {
        'statusCode': 200,
        'body': json.dumps('Hello, world!')
    }
