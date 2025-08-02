import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("medipal")


def log_request(medicine: str) -> None:
    """Log the incoming medicine request."""
    logger.info("Request for medicine: %s", medicine)
