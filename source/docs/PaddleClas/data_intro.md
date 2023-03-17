---
title: data_intro
date: 2023-03-08 20:35:48
---

{% raw %}


   <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">PaddleClas</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../index.html">Docs</a> »</li>
        
          <li><a href="index.html">初级使用</a> »</li>
        
      <li>数据说明</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
            
              <a href="https://github.com/PaddlePaddle/PaddleClas/blob/master/docs/zh_CN/tutorials/data.md" class="fa fa-github"> Edit on GitHub</a>
            
          
        
      </li>
    
  </ul>

  
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  <div class="section" id="id1">
<h1>数据说明<a class="headerlink" href="#id1" title="永久链接至标题">¶</a></h1>
<hr class="docutils">
<div class="section" id="id2">
<h2>1.简介<a class="headerlink" href="#id2" title="永久链接至标题">¶</a></h2>
<p>本文档介绍ImageNet1k和flowers102数据准备过程。</p>
</div>
<div class="section" id="id3">
<h2>2.数据集准备<a class="headerlink" href="#id3" title="永久链接至标题">¶</a></h2>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">数据集</th>
<th align="center">训练集大小</th>
<th align="center">测试集大小</th>
<th align="center">类别数</th>
<th align="center">备注</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center"><a href="https://www.robots.ox.ac.uk/~vgg/data/flowers/102/">flowers102</a></td>
<td align="center">1k</td>
<td align="center">6k</td>
<td align="center">102</td>
<td align="center"></td>
</tr>
<tr>
<td align="center"><a href="http://www.image-net.org/challenges/LSVRC/2012/">ImageNet1k</a></td>
<td align="center">1.2M</td>
<td align="center">50k</td>
<td align="center">1000</td>
<td align="center"></td>
</tr>
</tbody>
</table></div><ul class="simple">
<li>数据格式
按照如下结构组织数据，其中train_list.txt 和val_list.txt的格式形如</li>
</ul>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="c1"># 每一行采用"空格"分隔图像路径与标注</span>

ILSVRC2012_val_00000001.JPEG <span class="m">65</span>
...
</pre></div>
</div>
<div class="section" id="imagenet1k">
<h3>ImageNet1k<a class="headerlink" href="#imagenet1k" title="永久链接至标题">¶</a></h3>
<p>从官方下载数据后，按如下组织数据</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>PaddleClas/dataset/imagenet/
<span class="p">|</span>_ train/
<span class="p">|</span>  <span class="p">|</span>_ n01440764
<span class="p">|</span>  <span class="p">|</span>  <span class="p">|</span>_ n01440764_10026.JPEG
<span class="p">|</span>  <span class="p">|</span>  <span class="p">|</span>_ ...
<span class="p">|</span>  <span class="p">|</span>_ ...
<span class="p">|</span>  <span class="p">|</span>
<span class="p">|</span>  <span class="p">|</span>_ n15075141
<span class="p">|</span>     <span class="p">|</span>_ ...
<span class="p">|</span>     <span class="p">|</span>_ n15075141_9993.JPEG
<span class="p">|</span>_ val/
<span class="p">|</span>  <span class="p">|</span>_ ILSVRC2012_val_00000001.JPEG
<span class="p">|</span>  <span class="p">|</span>_ ...
<span class="p">|</span>  <span class="p">|</span>_ ILSVRC2012_val_00050000.JPEG
<span class="p">|</span>_ train_list.txt
<span class="p">|</span>_ val_list.txt
</pre></div>
</div>
</div>
<div class="section" id="flowers102">
<h3>Flowers102<a class="headerlink" href="#flowers102" title="永久链接至标题">¶</a></h3>
<p>从<a class="reference external" href="https://www.robots.ox.ac.uk/~vgg/data/flowers/102/">VGG官方网站</a>下载后的数据，解压后包括</p>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span>jpg/
setid.mat
imagelabels.mat
</pre></div>
</div>
<p>将以上文件放置在PaddleClas/dataset/flowers102/下</p>
<p>通过运行generate_flowers102_list.py生成train_list.txt和val_list.txt</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python generate_flowers102_list.py jpg train &gt; train_list.txt
python generate_flowers102_list.py jpg valid &gt; val_list.txt
</pre></div>
</div>
<p>按照如下结构组织数据：</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>PaddleClas/dataset/flowers102/
<span class="p">|</span>_ jpg/
<span class="p">|</span>  <span class="p">|</span>_ image_03601.jpg
<span class="p">|</span>  <span class="p">|</span>_ ...
<span class="p">|</span>  <span class="p">|</span>_ image_02355.jpg
<span class="p">|</span>_ train_list.txt
<span class="p">|</span>_ val_list.txt
</pre></div>
</div>
</div>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="getting_started.html" class="btn btn-neutral float-right" title="开始使用" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="quick_start.html" class="btn btn-neutral float-left" title="30分钟玩转PaddleClas" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
    </div>
  

  <hr><div><div id="rtd-sidebar" data-ea-publisher="readthedocs" data-ea-type="readthedocs-sidebar" data-ea-manual="true" class="ethical-rtd" data-ea-keywords="only words|paddleclas|readthedocs-project-593273|readthedocs-project-paddleclas" data-ea-campaign-types="community|house|paid"></div></div>

  
</footer>

        </div>
      </div>

    </section>
	
	
	{% endraw %}
