source activate vcftools

#### 提部分样本
vcftools --gzvcf test.vcf.gz --recode --recode-INFO-all --stdout --keep southpop.txt > southpop.vcf
bgzip southpop.vcf && bcftools index -t southpop.vcf.gz

###
bcftools view -s 02R0004,03R0016,02R0010 test.vcf.gz -Ov  > 2pop.vcf
bgzip 2pop.vcf && tabix -p vcf 2pop.vcf.gz

#### 提部分snp位点
vcftools --gzvcf 2pop.vcf.gz --positions specific_position.txt --recode --out specific_position.vcf

#### 提部分染色体
vcftools --gzvcf test.vcf.gz --chr $n --recode --recode-INFO-all --stdout | gzip -c > $n.vcf.gz
