# Git configuration (ubuntu)
sudo apt update
sudo apt install git

git config --global user.name "Ignacio Gómez"

# Generating SSH key (github)
ssh-keygen -t rsa -b 4096 -C "ignaciojgomez@outlook.es"
ssh-add github_rsa

# Copy github_rsa.pub to settings github website

# Clone repository
git clone https://github.com/ignacio-gomez-ortiz/cat-job-offer-exercise.git

# Create new feature branch (ignacio-testing)
git checkout -b ignacio-testing

