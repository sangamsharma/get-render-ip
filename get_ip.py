import requests
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def get_outbound_ip():
    try:
        response = requests.get("https://api.ipify.org")
        ip = response.text
        logger.info(f"Outbound IP address: {ip}")
        return ip
    except Exception as e:
        logger.error(f"Failed to get IP address: {e}")
        raise

if __name__ == "__main__":
    get_outbound_ip()
