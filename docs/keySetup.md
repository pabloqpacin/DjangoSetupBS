# Key Setup

## 1. Protect Django's secret key 

1. [ ] Copypaste the `SECRET_KEY` string in `settings.py` into the `.env` file (remove all spaces and quotation marks)

2. [ ] Replace `settings.py`'s `SECRET_KEY` string for:
```python
SECRET_KEY = str(os.getenv('SECRET_KEY'))
```

3. [ ] Copypaste this code snippet in `settings.py` top lines:
```python
# added to protect the secret key
import os
from dotenv import load_dotenv
load_dotenv()
```


## 2. Verify the server runs fine

1. [ ] Activate (.venv) if necessary:
```bash
cd ~/PWP/OhMyDjango
source .venv/bin/activate
```

2. [ ] Access the development server website running `python3 manage.py runserver` and doing `Ctrl+click` on  http://127.0.0.1:8000 (stop the server with `Ctrl+C`)


3. [ ] Deactivate (.venv) if necessary
```bash
deactivate
```


