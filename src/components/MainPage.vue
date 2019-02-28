<template>
  <el-tabs type="border-card">
    <el-tab-pane label="KeyGenerator">
      <el-row class="autocomplete">
        <el-col :span="6">
          <el-autocomplete
            class="inline-input"
            v-model="app_name"
            :fetch-suggestions="querySearch"
            placeholder="请输入内容"
            @select="handleSelect"
          ></el-autocomplete>
        </el-col>
        <el-col :span="6">
          <el-button @click="generaterKey" type="primary" plain>转换</el-button>
        </el-col>
        <el-col>
          <p style="font: PingFang SC; color: #409EFF; font-size:20px">密钥为： {{ key }}</p>
        </el-col>
      </el-row>
    </el-tab-pane>
    <el-tab-pane label="More">敬请期待</el-tab-pane>
  </el-tabs>
</template>

<script>
export default {
  data() {
    return {
      app_names: [],
      app_name: '',
      key: ''
    };
  },
  methods: {
    querySearch(queryString, cb) {
      var app_names = this.app_names;
      var results = queryString ? app_names.filter(this.createFilter(queryString)) : app_names;
      cb(results);
    },
    createFilter(queryString) {
      return (app_names) => {
        return (app_names.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
      };
    },
    loadAll() {
      return [
        { "value": "alipay" },
        { "value": "wechat" },
        { "value": "QQ" },
        { "value": "zhaoshang" },
        { "value": "yinlian" },
        { "value": "train" }
      ];
    },
    handleSelect(item) {
      // console.log(item);
    },
    
    randomStr(min, max, arr, seededRandom) {
      var str = "";
      var index = "";
      var range = min;
      //min,max范围内随机的一个数
      range = Math.floor(seededRandom() * (max - min + 1) + min);
      for(var i = 0; i < range; i++) {
          index = Math.round(seededRandom() * (arr.length - 1));
          str += arr[index];
      }
      return str;
    },
    generaterKey() {
      var app_name = this.app_name;
      var seededRandom = (function () {
        var seed = 0;
        app_name = String(app_name)
        for (var i=0; i<app_name.length; i++){
          seed += app_name[i].charCodeAt();
        }
        function rnd() {
          seed = ( seed * 9301 + 49297 ) % 233280;
          return seed / ( 233280.0 ); 
        }
        return function () {
          return rnd();
        }
      })()
      var arr1 = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      var arr2 = ['a', 'b',
      'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 
      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 
      'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 
      'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
      var arr3 = ['.', '@', '#', '$', '%', '^', '&', '*'];

      var str1 = this.randomStr(3, 5, arr1, seededRandom);
      var str2 = this.randomStr(10, 12, arr2, seededRandom);
      var str3 = this.randomStr(1, 3, arr3, seededRandom);
      // console.log(str1, str2, str3)
      
      var key = str1 + str2 + str3;
      this.key = key.split('').sort((a, b) => {
        var rand = Math.ceil(seededRandom() * 2)
        if(rand == 1) {
          return -1
        } else {
          return 1
        }
      }).join('')
      // console.log(this.key)
    },
  },
  mounted() {
    this.app_names = this.loadAll();
  }
}
</script>